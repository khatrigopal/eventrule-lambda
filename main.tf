resource "aws_cloudwatch_event_rule" "data_lake_lambda_trigger" {
  name        = "data_lake_lambda_trigger"
  description = "Trigger Lambda when new data is added to Data Lake"
  
  event_pattern = jsonencode({
    source = ["aws.datalake"]
    detail-type = ["Data Lake Object Created"]
  })

 }

resource "aws_cloudwatch_event_target" "lambda_target" {
  rule      = aws_cloudwatch_event_rule.data_lake_lambda_trigger.name
  target_id = "target-lambda"
  arn       = "arn:aws:lambda:us-east-1:558940753150:function:function1"
}

