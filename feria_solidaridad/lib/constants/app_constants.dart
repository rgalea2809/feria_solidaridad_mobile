// General constants
const String kFairEditionNumber = "XXI";

// Internet media links
const String kRectorVideoId = "cva1fD2dKt0";
const String kFacebookPageUrl = "facebook.com/serviciosocialuca";
const String kInstagramPageUrl = "instagram.com/serviciosocialuca";
const String kContactEmail = "instagram.com/serviciosocialuca";

// Api Constants
const String kApiBaseUrl = "feria-solidaridad-server.vercel.app";

// API - Institutions
enum ApiPath { getAllInstitutions, getAllProjects, getAllEvents }

const Map<ApiPath, String> kApiPaths = {
  ApiPath.getAllInstitutions: "/institution",
  ApiPath.getAllProjects: "/project",
  ApiPath.getAllEvents: "/event"
};
