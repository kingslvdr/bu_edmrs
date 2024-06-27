
class ApiEndpoints{
  static const String baseUrl = "https://agro.cpf-phil.com/edmrs_approver/api/";
  // static const String baseUrl = "https://agro.cpf-phil.com/edmrs_approver/test/";
  static AuthEndPoints authEndPoints = AuthEndPoints();
}

class AuthEndPoints{
  final String login = 'login';
  final String balance = 'getBalance';
  final String getInbox = 'getApproval';
  final String requestData = 'getReqDetails';
  final String approve = 'approveRequest';
  final String reject = 'rejectRequest';
}