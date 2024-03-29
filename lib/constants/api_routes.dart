abstract class ApiRoutes {

  static const baseURl = "https://functionworld-backend-production.up.railway.app";

  static const consumerRegisterRoute = "$baseURl/register/consumer";  
  static const consumerVerifyMailRoute = "$baseURl/consumer/verifyEmail";
  static const consumerFeedRoute = "$baseURl/consumer/feed?page=";
}