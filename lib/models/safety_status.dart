enum SafetyStatusType { safe, needHelp, unknown }

class SafetyStatus {
  final String name;
  final SafetyStatusType status;

  SafetyStatus({required this.name, required this.status});
}
