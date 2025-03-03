# Deploy Nginx
resource "kubernetes_deployment" "test_app" {
  metadata {
    name      = "nginx"
    namespace = "test-app"
  }
  spec {
    replicas = 2
    selector {
      match_labels = {
        app = "nginx"
      }
    }
    template {
      metadata {
        labels = {
          app = "nginx"
        }
      }
      spec {
        container {
          name  = "nginx"
          image = "nginx:latest"
          port {
            container_port = 80
          }
        }
      }
    }
  }
}

# Expose Nginx via ALB
resource "kubernetes_service" "nginx" {
  metadata {
    name      = "nginx"
    namespace = "test-app"
    annotations = {
      "service.beta.kubernetes.io/aws-load-balancer-type" = "alb"
      "service.beta.kubernetes.io/aws-load-balancer-scheme" = "internet-facing"
    }
  }
  spec {
    selector = {
      app = "nginx"
    }
    port {
      port        = 80
      target_port = 80
    }
    type = "LoadBalancer"
  }
}