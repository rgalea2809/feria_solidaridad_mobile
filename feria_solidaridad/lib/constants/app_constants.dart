// General constants
const String kFairEditionNumber = "XXI";

// Internet media links
const String kRectorVideoId = "cva1fD2dKt0";
const String kFacebookPageUrl = "facebook.com/serviciosocialuca";
const String kInstagramPageUrl = "instagram.com/serviciosocialuca";
const String kContactEmail = "instagram.com/serviciosocialuca";

// Api Constants
const String kApiBaseUrl = "feria-solidaridad-server.vercel.app";

// API
enum ApiPath {
  getAllInstitutions,
  getAllProjects,
  getAllEvents,
  getHomeData,
  getAllImages
}

const Map<ApiPath, String> kApiPaths = {
  ApiPath.getAllInstitutions: "/institution",
  ApiPath.getAllProjects: "/project",
  ApiPath.getAllEvents: "/event",
  ApiPath.getHomeData: "/home-page",
  ApiPath.getAllImages: "/images",
};

// Form
String kInscriptionFormUrl = "https://forms.gle/7jRmeJHrCpGYAsfR9";
