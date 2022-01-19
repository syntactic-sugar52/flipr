import 'package:Flipr/model.dart/sellerfields.dart';
import 'package:gsheets/gsheets.dart';

class SellerSheetsApi {
  static const _spreadsheetId = '1PLxKtc2j-kJmo3S3uVs9LuVn9saWXvmEbi8GD_t6R4o';
  static const _credentials = r'''
  {
  "type": "service_account",
  "project_id": "flipr-338500",
  "private_key_id": "0866224bce57f04c62f59eee358559f5d5d7738e",
  "private_key": "-----BEGIN PRIVATE KEY-----\nMIIEvgIBADANBgkqhkiG9w0BAQEFAASCBKgwggSkAgEAAoIBAQC8v0j0tubNLXh5\nRDLsoGga7NHcg1g1QuZpFZvDlBL7WuA+b1xbPf9BxXZF8ZThbW1N61rldNWpKI3z\nsd9kNBWabPWsmbaTZny9Q++8eA7uj7QnpLqNS8vLb76aASzSWo+TuqCtTGQWHSfv\nVAq/ROR1MehRgKFU8LhwxbVW56LqgbvEU+uDYJYFrIqYix9z35nqGm8y9kepykOj\ngR6vOkmbBsqYaHThNqNZsPZqxJjjkoQ4dsV4j7jEIxF9hhqJnNU3337Qi58GftdK\nlh3t3uYb9/1DWHR77LGAhWKYczimT++pnNmoB18sXmBdJoPXrsVL3OHQzI61lVwQ\nENKcq0dzAgMBAAECggEAT29bp23wbap02OhsXCzYE3jWi60Vavj4WoJ3FxUS9gkV\ndgFNB7NsYYRWlfIpm8P/a/sguo/0uefw8f5Ki3PmIaM4s8bPUXKhDdBxLUsD0b/V\n7JdF0eBz6O7i8xKKiA8H/P7ez4BmYO4tV+pxSXUXhwEVinONsl9K6F80xdnftTxi\nP4+bti2JaQNPqhX/hVBGTAQQYidlNLc8wHl8PDhYcJO8Qw0ELCcAo+7H7+rX6ivz\nh84bowdfwN2R83rgF6Ku5yfnk8nbjUuOASFyzhkcnzBgpN78cXTNiWpEC0joQbBC\nQImFHHVgjB85Rywpa0KS2Hl3QgRskmbTPEEfLTyvTQKBgQDdiqwQgJuJ15NOXLIF\nzjwhg6OS8ntAuCuhlc1cMpWwKS74YvZZnBxuKFifGlnlZJCks0KatlLvg1Dq5P6s\n+bt6MpHHxahncvtUGbApJZxHWH9eM6L7Vg3SWl+HINMqbd+/Qg1ct7PMrqcx37RP\ngJ1nhPnQAJBKNhoLn5cUItHQfQKBgQDaGs4WpaBwsJwIy9O9NEZzAnTe0iN2GVrK\nIlLbqBk9VJE7Rg1zR+5/gtCeIEoIEwzBAAaTkKtGsQvRpnnony7dnmVTP/JDlv5K\nhnTS1G3dnGs+VL58xK5L7Cm7lHarKEBCcMd7gnXgfSbIx1xNv8mRUSzQcrGlc0vC\nPXhOWLJqrwKBgQCn/9rPgNdyRjn8uKp/YI+U0qCedKcmwwLDPDhI7Es7FV/7GAC8\nn3enyYy6yl7VZ9eQLigZ7p0h6DDaj+DZB2A2IFcQaUF1gWo5smk2KsFCEUg1BW9Y\nrT85/zJl5Gx9xmhgPxSm9N+yHdfIKF4x09SJhfty0pqYzEIgAlus92KoeQKBgHEi\nVGLE+UtbISUi7auIUT7ZOFxYrpJVJpYRZd+Q+76nfko71UBGQL2d0q8jWqODlisK\n415qPZ4GunW+oB/9amcFAdREKFvNGAz6X+D41iCNQcfsV38K2sqBL0ihA0lXMLYG\nIEO98X1IDfU6DHQ8FsetTsy1odaLzvFrx1sEgU/7AoGBAMQq4wdwFC/qQ6GcZIoz\nd9OkfLU2d6DWllCmNDBuHY6fxxcBEHjgbLlpgj5x/4t9kPySIHQ+ij+AFs+hz3wo\nZPiuID0cPs+cRjyBTQHfiqRCODVW8xd4WqkVJLG5Gun0hAY3y8OifvX9etk5/Bl2\noc27/KyBoOEU5vJgguUfE6B1\n-----END PRIVATE KEY-----\n",
  "client_email": "flipr-490@flipr-338500.iam.gserviceaccount.com",
  "client_id": "116049318044373965843",
  "auth_uri": "https://accounts.google.com/o/oauth2/auth",
  "token_uri": "https://oauth2.googleapis.com/token",
  "auth_provider_x509_cert_url": "https://www.googleapis.com/oauth2/v1/certs",
  "client_x509_cert_url": "https://www.googleapis.com/robot/v1/metadata/x509/flipr-490%40flipr-338500.iam.gserviceaccount.com"
}
  ''';

  static final _gsheets = GSheets(_credentials);
  static Worksheet? _sellerSheet;
  static Future init() async {
    try {
      final spreadsheet = await _gsheets.spreadsheet(_spreadsheetId);
      _sellerSheet = await _getWorkSheet(spreadsheet, title: 'sellOnFlipr');

      final firstRow = SellerFields.getFields();
      _sellerSheet!.values.insertRow(1, firstRow);
    } catch (e) {
      print('Init error: $e');
    }
  }

  static Future<Worksheet> _getWorkSheet(Spreadsheet spreadsheet,
      {required String title}) async {
    try {
      return await spreadsheet.addWorksheet(title);
    } catch (e) {
      return spreadsheet.worksheetByTitle(title)!;
    }
  }

  static Future insert(List<Map<String, dynamic>> rowList) async {
    if (_sellerSheet == null) return;
    _sellerSheet!.values.map.appendRows(rowList);
  }

  static Future<int> getRowCount() async {
    if (_sellerSheet == null) return 0;
    final lastRow = await _sellerSheet!.values.lastRow();
    return lastRow == null ? 0 : int.tryParse(lastRow.first) ?? 0;
  }
}
