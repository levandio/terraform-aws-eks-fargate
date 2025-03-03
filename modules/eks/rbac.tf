# Create a limited-access Role for test-app namespace
resource "kubernetes_role" "test_app" {
  metadata {
    name      = "test-app-role"
    namespace = "test-app"
  }
  rule {
    api_groups = [""]
    resources  = ["pods", "services"]
    verbs      = ["get", "list", "watch"]
  }
}

# Bind the Role to a ServiceAccount
resource "kubernetes_role_binding" "test_app" {
  metadata {
    name      = "test-app-rolebinding"
    namespace = "test-app"
  }
  role_ref {
    api_group = "rbac.authorization.k8s.io"
    kind      = "Role"
    name      = kubernetes_role.test_app.metadata[0].name
  }
  subject {
    kind      = "ServiceAccount"
    name      = "default"
    namespace = "test-app"
  }
}