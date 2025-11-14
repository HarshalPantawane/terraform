resource "aws_iam_role" "lambda_role" {
  name = "lambda_execution_role"

  assume_role_policy = jsonencode({
        Version = "2012-10-17"
        Statement = [{
            Action = "sts:AssumeRole"
            Effect = "Allow"
            Principal = {
                Service = "lambda.amazonaws.com"
            }
        }]
    })
}

resource "aws_iam_role_policy_attachment" "lambda_policy" {
  role = aws_iam_role.lambda_role.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
}


resource "aws_lambda_function" "lambda_function" {
  function_name = "lambda_function"
  role = aws_iam_role.lambda_role.arn
  handler = "lambda_function.lambda_handler"
  runtime = "python3.9"
  memory_size = 128
  timeout = 900

  filename = "lambda_function.zip"
  source_code_hash = filebase64sha256("lambda_function.zip")  # Track changes in zip fie 
}

resource "aws_cloudwatch_event_rule" "every_five_minutes" {
  name = "every_five_minutes"
  description = "Trigger lambda every five minutes"
  schedule_expression = "rate(5 minutes)"           # set time to Trigger lambda
#   schedule_expression = "cron(0/5 * * * ? *)"
}

resource "aws_cloudwatch_event_target" "invoke_lambda" {
  rule = aws_cloudwatch_event_rule.every_five_minutes.name
  target_id = "lambda"
  arn = aws_lambda_function.lambda_function.arn
}

resource "aws_lambda_permission" "Allow_eventbridge" {
  statement_id = "AllowExecutionFromEventBridge"
  action = "lambda:InvokeFunction"
  function_name =   aws_lambda_function.lambda_function.function_name
  principal = "events.amazonaws.com"
  source_arn = aws_cloudwatch_event_rule.every_five_minutes.arn
  
}