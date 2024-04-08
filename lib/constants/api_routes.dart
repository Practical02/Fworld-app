abstract class ApiRoutes {

  static const baseURl = "https://functionworld-backend-production.up.railway.app";

  static const consumerRegisterRoute = "$baseURl/register/consumer"; 
  static const consumerLoginRoute = "$baseURl/login/consumer"; 
  static const consumerVerifyMailRoute = "$baseURl/consumer/verifyEmail";
  static const consumerFeedRoute = "$baseURl/consumer/feed?page=";
  static const consumerVendorRoute = "$baseURl/consumer/vendor?id=";
  static const consumerFollowVendorRoute = "$baseURl/consumer/follow";
  static const consumerLikeVendorRoute = "$baseURl/consumer/like";
  static const consumerFavouriteVendorRoute = "$baseURl/consumer/favourite";
}