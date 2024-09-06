// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a la locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'la';

  static String m0(n) => "${n} ລາຍການ";

  static String m1(name) => "${name} ເພີ່ມສຳເລັດ";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
        "addToCart": MessageLookupByLibrary.simpleMessage("ຕື່ມໃສ່ກະຕ່າ"),
        "cancel": MessageLookupByLibrary.simpleMessage("ຍົກເລີກ"),
        "cart": MessageLookupByLibrary.simpleMessage("ກະຕ່າ"),
        "cartIsEmpty": MessageLookupByLibrary.simpleMessage(
            "ບໍ່ມີສິນຄ້າຢູ່ໃນກະຕ່າຂອງທ່ານ."),
        "checkout": MessageLookupByLibrary.simpleMessage("ຊໍາລະ"),
        "checkoutDialogDesc": MessageLookupByLibrary.simpleMessage(
            "ທ່ານຕ້ອງການຊື້ຜະລິດຕະພັນທີ່ເລືອກບໍ?"),
        "checkoutDialogSuccessToast":
            MessageLookupByLibrary.simpleMessage("ການຊື້ຂອງທ່ານສໍາເລັດແລ້ວ."),
        "dark": MessageLookupByLibrary.simpleMessage("ມືດ"),
        "delete": MessageLookupByLibrary.simpleMessage("ລຶບ"),
        "deleteDialogDesc": MessageLookupByLibrary.simpleMessage(
            "ທ່ານຕ້ອງການລຶບຜະລິດຕະພັນທີ່ເລືອກອອກຈາກກະຕ່າບໍ?"),
        "deleteDialogSuccessToast":
            MessageLookupByLibrary.simpleMessage("ລຶບແລ້ວ."),
        "description": MessageLookupByLibrary.simpleMessage("ລາຍລະອຽດ"),
        "en": MessageLookupByLibrary.simpleMessage("ພາສາອັງກິດ"),
        "items": m0,
        "ko": MessageLookupByLibrary.simpleMessage("ພາສາລາວ"),
        "language": MessageLookupByLibrary.simpleMessage("ພາສາ"),
        "light": MessageLookupByLibrary.simpleMessage("ແສງ"),
        "lo": MessageLookupByLibrary.simpleMessage("ລາວ"),
        "noProduct": MessageLookupByLibrary.simpleMessage("ບໍ່ມີສິນຄ້າ."),
        "product": MessageLookupByLibrary.simpleMessage("ຜະລິດຕະພັນ"),
        "productAdded": m1,
        "quantity": MessageLookupByLibrary.simpleMessage("ປະລິມານ"),
        "searchProduct":
            MessageLookupByLibrary.simpleMessage("ຊອກຫາຜະລິດຕະພັນ"),
        "selectedItems": MessageLookupByLibrary.simpleMessage("ລາຍການທີ່ເລືອກ"),
        "shopping": MessageLookupByLibrary.simpleMessage("ຊື້ເຄື່ອງ"),
        "theme": MessageLookupByLibrary.simpleMessage("ຫົວຂໍ້"),
        "totalPrice": MessageLookupByLibrary.simpleMessage("ລາຄາລວມ")
      };
}
