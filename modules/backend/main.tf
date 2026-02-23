resource "aws_apigatewayv2_integration" "app" {
  api_id                 = aws_apigatewayv2_api.api.id
  integration_type       = "AWS_PROXY"
  integration_uri        = aws_lambda_function.app.invoke_arn
  integration_method     = "POST"
  payload_format_version = "2.0"
}
resource "aws_apigatewayv2_route" "auth_register" {
  api_id    = aws_apigatewayv2_api.api.id
  route_key = "POST /api/v1/auth/register"
  target    = "integrations/${aws_apigatewayv2_integration.app.id}"
}
resource "aws_apigatewayv2_route" "auth_login" {
  api_id    = aws_apigatewayv2_api.api.id
  route_key = "POST /api/v1/auth/login"
  target    = "integrations/${aws_apigatewayv2_integration.app.id}"
}
resource "aws_apigatewayv2_route" "auth_refresh" {
  api_id    = aws_apigatewayv2_api.api.id
  route_key = "POST /api/v1/auth/refresh"
  target    = "integrations/${aws_apigatewayv2_integration.app.id}"
}
resource "aws_apigatewayv2_route" "auth_create_jwt" {
  api_id    = aws_apigatewayv2_api.api.id
  route_key = "POST /api/v1/auth"
  target    = "integrations/${aws_apigatewayv2_integration.app.id}"
}
resource "aws_apigatewayv2_route" "auth_verify" {
  api_id    = aws_apigatewayv2_api.api.id
  route_key = "POST /api/v1/auth/verify"
  target    = "integrations/${aws_apigatewayv2_integration.app.id}"
}
resource "aws_apigatewayv2_route" "api_info" {
  api_id    = aws_apigatewayv2_api.api.id
  route_key = "GET /api"
  target    = "integrations/${aws_apigatewayv2_integration.app.id}"
}
resource "aws_apigatewayv2_route" "api_docs" {
  api_id    = aws_apigatewayv2_api.api.id
  route_key = "GET /api/docs"
  target    = "integrations/${aws_apigatewayv2_integration.app.id}"
}
resource "aws_apigatewayv2_route" "health" {
  api_id    = aws_apigatewayv2_api.api.id
  route_key = "GET /health"
  target    = "integrations/${aws_apigatewayv2_integration.app.id}"
}
resource "aws_apigatewayv2_route" "health_db" {
  api_id    = aws_apigatewayv2_api.api.id
  route_key = "GET /health/db"
  target    = "integrations/${aws_apigatewayv2_integration.app.id}"
}
resource "aws_apigatewayv2_route" "health_metrics" {
  api_id    = aws_apigatewayv2_api.api.id
  route_key = "GET /health/metrics"
  target    = "integrations/${aws_apigatewayv2_integration.app.id}"
}
resource "aws_apigatewayv2_route" "user_post" {
  api_id    = aws_apigatewayv2_api.api.id
  route_key = "POST /api/user"
  target    = "integrations/${aws_apigatewayv2_integration.app.id}"
}
resource "aws_apigatewayv2_route" "user_get" {
  api_id    = aws_apigatewayv2_api.api.id
  route_key = "GET /api/user"
  target    = "integrations/${aws_apigatewayv2_integration.app.id}"
}
resource "aws_apigatewayv2_route" "user_get_id" {
  api_id    = aws_apigatewayv2_api.api.id
  route_key = "GET /api/user/{id}"
  target    = "integrations/${aws_apigatewayv2_integration.app.id}"
}
resource "aws_apigatewayv2_route" "user_patch_id" {
  api_id    = aws_apigatewayv2_api.api.id
  route_key = "PATCH /api/user/{id}"
  target    = "integrations/${aws_apigatewayv2_integration.app.id}"
}
resource "aws_apigatewayv2_route" "user_delete_id" {
  api_id    = aws_apigatewayv2_api.api.id
  route_key = "DELETE /api/user/{id}"
  target    = "integrations/${aws_apigatewayv2_integration.app.id}"
}
resource "aws_apigatewayv2_route" "roles_post" {
  api_id    = aws_apigatewayv2_api.api.id
  route_key = "POST /api/roles"
  target    = "integrations/${aws_apigatewayv2_integration.app.id}"
}
resource "aws_apigatewayv2_route" "roles_get" {
  api_id    = aws_apigatewayv2_api.api.id
  route_key = "GET /api/roles"
  target    = "integrations/${aws_apigatewayv2_integration.app.id}"
}
resource "aws_apigatewayv2_route" "roles_get_id" {
  api_id    = aws_apigatewayv2_api.api.id
  route_key = "GET /api/roles/{id}"
  target    = "integrations/${aws_apigatewayv2_integration.app.id}"
}
resource "aws_apigatewayv2_route" "roles_patch_id" {
  api_id    = aws_apigatewayv2_api.api.id
  route_key = "PATCH /api/roles/{id}"
  target    = "integrations/${aws_apigatewayv2_integration.app.id}"
}
resource "aws_apigatewayv2_route" "roles_delete_id" {
  api_id    = aws_apigatewayv2_api.api.id
  route_key = "DELETE /api/roles/{id}"
  target    = "integrations/${aws_apigatewayv2_integration.app.id}"
}
resource "aws_apigatewayv2_route" "influencer_post" {
  api_id    = aws_apigatewayv2_api.api.id
  route_key = "POST /api/v1/influencer"
  target    = "integrations/${aws_apigatewayv2_integration.app.id}"
}
resource "aws_apigatewayv2_route" "influencer_get" {
  api_id    = aws_apigatewayv2_api.api.id
  route_key = "GET /api/v1/influencer"
  target    = "integrations/${aws_apigatewayv2_integration.app.id}"
}
resource "aws_apigatewayv2_route" "influencer_get_id" {
  api_id    = aws_apigatewayv2_api.api.id
  route_key = "GET /api/v1/influencer/{id}"
  target    = "integrations/${aws_apigatewayv2_integration.app.id}"
}
resource "aws_apigatewayv2_route" "influencer_patch_id" {
  api_id    = aws_apigatewayv2_api.api.id
  route_key = "PATCH /api/v1/influencer/{id}"
  target    = "integrations/${aws_apigatewayv2_integration.app.id}"
}
resource "aws_apigatewayv2_route" "influencer_delete_id" {
  api_id    = aws_apigatewayv2_api.api.id
  route_key = "DELETE /api/v1/influencer/{id}"
  target    = "integrations/${aws_apigatewayv2_integration.app.id}"
}
resource "aws_apigatewayv2_route" "coupon_post" {
  api_id    = aws_apigatewayv2_api.api.id
  route_key = "POST /api/v1/coupon"
  target    = "integrations/${aws_apigatewayv2_integration.app.id}"
}
resource "aws_apigatewayv2_route" "coupon_get" {
  api_id    = aws_apigatewayv2_api.api.id
  route_key = "GET /api/v1/coupon"
  target    = "integrations/${aws_apigatewayv2_integration.app.id}"
}
resource "aws_apigatewayv2_route" "coupon_get_id" {
  api_id    = aws_apigatewayv2_api.api.id
  route_key = "GET /api/v1/coupon/{id}"
  target    = "integrations/${aws_apigatewayv2_integration.app.id}"
}
resource "aws_apigatewayv2_route" "coupon_patch_id" {
  api_id    = aws_apigatewayv2_api.api.id
  route_key = "PATCH /api/v1/coupon/{id}"
  target    = "integrations/${aws_apigatewayv2_integration.app.id}"
}
resource "aws_apigatewayv2_route" "coupon_delete_id" {
  api_id    = aws_apigatewayv2_api.api.id
  route_key = "DELETE /api/v1/coupon/{id}"
  target    = "integrations/${aws_apigatewayv2_integration.app.id}"
}
resource "aws_apigatewayv2_route" "campaign_post" {
  api_id    = aws_apigatewayv2_api.api.id
  route_key = "POST /api/v1/campaign"
  target    = "integrations/${aws_apigatewayv2_integration.app.id}"
}
resource "aws_apigatewayv2_route" "campaign_get" {
  api_id    = aws_apigatewayv2_api.api.id
  route_key = "GET /api/v1/campaign"
  target    = "integrations/${aws_apigatewayv2_integration.app.id}"
}
resource "aws_apigatewayv2_route" "campaign_get_id" {
  api_id    = aws_apigatewayv2_api.api.id
  route_key = "GET /api/v1/campaign/{id}"
  target    = "integrations/${aws_apigatewayv2_integration.app.id}"
}
resource "aws_apigatewayv2_route" "campaign_patch_id" {
  api_id    = aws_apigatewayv2_api.api.id
  route_key = "PATCH /api/v1/campaign/{id}"
  target    = "integrations/${aws_apigatewayv2_integration.app.id}"
}
resource "aws_apigatewayv2_route" "campaign_delete_id" {
  api_id    = aws_apigatewayv2_api.api.id
  route_key = "DELETE /api/v1/campaign/{id}"
  target    = "integrations/${aws_apigatewayv2_integration.app.id}"
}



resource "aws_apigatewayv2_api" "api" {
  name          = var.service_name
  protocol_type = "HTTP"
  description   = "Serverless API"
  tags          = var.tags

  cors_configuration {
    allow_credentials = false
    allow_headers     = []
    allow_methods = [
      "GET",
      "HEAD",
      "OPTIONS",
      "POST",
      "PUT",
      "DELETE",
    ]
    allow_origins = [
      "*",
    ]
    expose_headers = [
      "*",
    ]
    max_age = 300
  }
}

resource "aws_cloudwatch_log_group" "api_gw" {
  name = "/aws/api_gw/${aws_apigatewayv2_api.api.name}-api"

  retention_in_days = var.apigw_log_retention
}


resource "aws_apigatewayv2_stage" "base" {
  api_id      = aws_apigatewayv2_api.api.id
  name        = "$default"
  auto_deploy = true

  access_log_settings {
    destination_arn = aws_cloudwatch_log_group.api_gw.arn

    format = jsonencode({
      requestId               = "$context.requestId"
      sourceIp                = "$context.identity.sourceIp"
      requestTime             = "$context.requestTime"
      protocol                = "$context.protocol"
      httpMethod              = "$context.httpMethod"
      resourcePath            = "$context.resourcePath"
      routeKey                = "$context.routeKey"
      status                  = "$context.status"
      responseLength          = "$context.responseLength"
      integrationErrorMessage = "$context.integrationErrorMessage"
      }
    )
  }

}

resource "aws_iam_role" "lambda_exec" {
  name = "${var.service_name}-lambda-exec-role"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "lambda.amazonaws.com"
        }
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "lambda_exec_policy" {
  role       = aws_iam_role.lambda_exec.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
}


data "archive_file" "lambda_zip" {
  type = "zip"

  source_dir  = "${path.root}/project"
  output_path = "${path.module}/lambda_function_payload.zip"
}

resource "aws_lambda_function" "app" {
  function_name = "${var.service_name}-function"
  description   = "Offer, demmand service"
  role          = aws_iam_role.lambda_exec.arn
  handler       = "dist/src/main.handler"
  runtime       = "nodejs20.x"

  filename         = data.archive_file.lambda_zip.output_path
  source_code_hash = data.archive_file.lambda_zip.output_base64sha256

  timeout = 10
  memory_size = 512
  environment {
    variables = {
      DATABASE_URL       = var.database_url
      DB_PASSWORD        = var.db_password
      DB_USERNAME        = var.db_username
      NODE_ENV           = "production"
      PORT               = "3000"
      JWT_SECRET         = "redcard-secret-me"
      JWT_REFRESH_SECRET = "redcard-refresh-secret-me"
      CORS_ORIGIN        = "*"
      LOG_LEVEL          = "info"
    }
  }
}

resource "aws_cloudwatch_log_group" "lambda_log" {
  name              = "/aws/lambda/${aws_lambda_function.app.function_name}"
  retention_in_days = 7
}


resource "aws_lambda_permission" "allow_apigw_invoke" {
  statement_id  = "AllowExecutionFromAPIGateway"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.app.arn
  principal     = "apigateway.amazonaws.com"
  source_arn    = "${aws_apigatewayv2_api.api.execution_arn}/*/*"
}

