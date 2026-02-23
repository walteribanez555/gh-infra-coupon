
resource "aws_s3_bucket" "frontend_static_page_bucket" {
  bucket = var.bucketname
  tags   = var.tags
}

resource "aws_s3_bucket_ownership_controls" "s3_ownership_controls" {
  bucket = aws_s3_bucket.frontend_static_page_bucket.id

  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

resource "aws_s3_bucket_public_access_block" "s3_public_access_block" {
  bucket = aws_s3_bucket.frontend_static_page_bucket.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

resource "aws_s3_bucket_website_configuration" "website" {
  bucket = aws_s3_bucket.frontend_static_page_bucket.id
  index_document {
    suffix = "index.html"
  }
}


resource "aws_cloudfront_origin_access_control" "oac" {
  name = "s3-oac"
  description = "Origin Access Control for S3 bucket"
  signing_behavior = "never"
  signing_protocol = "sigv4"
  origin_access_control_origin_type = "s3"
}

resource "aws_cloudfront_response_headers_policy" "allowCors" {
  name    = "allow-cors-policy"
  comment = "Allow all methods and origins for CORS"

  cors_config {
    access_control_allow_credentials = false

    access_control_allow_headers {
      items = ["*"]
    }

    access_control_allow_methods {
      items = ["GET", "HEAD", "OPTIONS", "PUT", "POST", "PATCH", "DELETE"]
    }

    access_control_allow_origins {
      items = ["*"]
    }

    origin_override = true
  }
}
  


resource "aws_cloudfront_distribution" "s3_distribution" {
  origin {
    domain_name = aws_s3_bucket.frontend_static_page_bucket.bucket_regional_domain_name
    origin_id   = "S3Origin"
    s3_origin_config {
      origin_access_identity = aws_cloudfront_origin_access_identity.oai.cloudfront_access_identity_path
    }
  }
  

  enabled             = true
  is_ipv6_enabled     = true
  default_root_object = "index.html"
  comment             =  "CloudFront distribution for frontend static page"
  default_cache_behavior {
    target_origin_id       = "S3Origin"
    viewer_protocol_policy = "allow-all"
    allowed_methods        = ["GET", "HEAD", "POST", "PUT", "PATCH", "DELETE", "OPTIONS"]
    cached_methods         = ["GET", "HEAD"]
    forwarded_values {
      query_string = false
      cookies {
        forward = "none"
      }
    }

    min_ttl     = 0
    response_headers_policy_id = aws_cloudfront_response_headers_policy.allowCors.id
    max_ttl     = 86400

  }

  viewer_certificate {
    cloudfront_default_certificate = true
  }

  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }



  custom_error_response {
    error_code            = 403
    response_code         = 200
    response_page_path    = "/index.html"
    error_caching_min_ttl = 60
  }

  custom_error_response {
    error_code            = 404
    response_code         = 200
    response_page_path    = "/index.html"
    error_caching_min_ttl = 60
  }


  tags = var.tags
}

resource "aws_cloudfront_origin_access_identity" "oai" {
  comment = "Allow CloudFront to access S3 bucket"
  
}



resource "aws_s3_bucket_policy" "frontend_bucket_policy" {
  bucket = aws_s3_bucket.frontend_static_page_bucket.id
    policy = jsonencode({
      Version = "2012-10-17"
      Statement = [
        {
          Effect = "Allow"
          Principal = {
            AWS = aws_cloudfront_origin_access_identity.oai.iam_arn
          }
          Action = [
            "s3:GetObject"
          ]
          Resource = [
            "${aws_s3_bucket.frontend_static_page_bucket.arn}/*"
          ]
        }
      ]
    })
}