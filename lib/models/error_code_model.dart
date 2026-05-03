/// Data model for AC error codes
class ErrorCodeModel {
  final String code;
  final String title;
  final String description;
  final ErrorSeverity severity;

  const ErrorCodeModel({
    required this.code,
    required this.title,
    required this.description,
    required this.severity,
  });
}

enum ErrorSeverity { low, medium, high }

/// Dummy error code data
const List<ErrorCodeModel> kErrorCodes = [
  ErrorCodeModel(
    code: 'CH01',
    title: 'Indoor Air Sensor',
    description: 'Indoor air temperature sensor failure',
    severity: ErrorSeverity.medium,
  ),
  ErrorCodeModel(
    code: 'CH02',
    title: 'Pipe Sensor Error',
    description: 'Indoor pipe temperature sensor fault',
    severity: ErrorSeverity.medium,
  ),
  ErrorCodeModel(
    code: 'CH05',
    title: 'Communication Error',
    description: 'Indoor/outdoor unit communication lost',
    severity: ErrorSeverity.high,
  ),
  ErrorCodeModel(
    code: 'CH10',
    title: 'Fan Motor Issue',
    description: 'Indoor fan motor speed abnormality',
    severity: ErrorSeverity.high,
  ),
  ErrorCodeModel(
    code: 'CH38',
    title: 'Refrigerant Leak',
    description: 'Refrigerant leakage detected by sensor',
    severity: ErrorSeverity.high,
  ),
  ErrorCodeModel(
    code: 'CH60',
    title: 'Outdoor Sensor',
    description: 'Outdoor temperature sensor malfunction',
    severity: ErrorSeverity.low,
  ),
];
