import 'package:get/get.dart';
import 'package:note_nexus/common/variables.dart';

class UploadController extends GetxController {
  RxBool showSubjects = false.obs;
  RxBool showSemester = true.obs;
  RxBool showBranch = true.obs;
  RxString? key = "CSE1".obs;
  String? branch;
  String? semester;
  String? subject;
  String? type;

  void setDefault() {
    showSubjects = false.obs;
    showSemester = true.obs;
    showBranch = true.obs;
    branch = null;
    semester = null;
    subject = null;
    type = null;
  }

  void setField(String value, DROPDOWNITEMS dropdownitem) {
    if (dropdownitem == DROPDOWNITEMS.branch) {
      setBranch(value);
    } else if (dropdownitem == DROPDOWNITEMS.semester) {
      setSemester(value);
    } else if (dropdownitem == DROPDOWNITEMS.subject) {
      setSubject(value);
    } else if (dropdownitem == DROPDOWNITEMS.type) {
      setType(value);
    }
  }

  void setBranch(String value) {
    branch = value;
    if (semester != null) {
      key!.value = "$branch$semester";
      showSubjects.value = true;
    }
  }

  void setSemester(String value) {
    semester = value;
    if (branch != null) {
      key!.value = "$branch$semester";
      showSubjects.value = true;
    }
  }

  void setSubject(String value) {
    if (value != "Select subject") {
      showBranch.value = false;
      showSemester.value = false;
    } else {
      showBranch.value = true;
      showSemester.value = true;
    }
    subject = value;
  }

  void setType(String value) {
    type = value;
  }
}
