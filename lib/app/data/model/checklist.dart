class CheckListModel {
  String? sId;
  String? checklistTitleEnglish;
  String? checklistTitleBangla;
  String? checklistDescriptionEnglish;
  String? checklistDescriptionBangla;
  String? checklistStatus;
  int? checklistIndexGroup;
  String? checklistOrigin;
  String? createdAt;
  String? updatedAt;
  int? iV;

  CheckListModel(
      {this.sId,
      this.checklistTitleEnglish,
      this.checklistTitleBangla,
      this.checklistDescriptionEnglish,
      this.checklistDescriptionBangla,
      this.checklistStatus,
      this.checklistIndexGroup,
      this.checklistOrigin,
      this.createdAt,
      this.updatedAt,
      this.iV});

  CheckListModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    checklistTitleEnglish = json['checklist_title_english'];
    checklistTitleBangla = json['checklist_title_bangla'];
    checklistDescriptionEnglish = json['checklist_description_english'];
    checklistDescriptionBangla = json['checklist_description_bangla'];
    checklistStatus = json['checklist_status'];
    checklistIndexGroup = json['checklist_index_group'];
    checklistOrigin = json['checklist_origin'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['checklist_title_english'] = this.checklistTitleEnglish;
    data['checklist_title_bangla'] = this.checklistTitleBangla;
    data['checklist_description_english'] = this.checklistDescriptionEnglish;
    data['checklist_description_bangla'] = this.checklistDescriptionBangla;
    data['checklist_status'] = this.checklistStatus;
    data['checklist_index_group'] = this.checklistIndexGroup;
    data['checklist_origin'] = this.checklistOrigin;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}
