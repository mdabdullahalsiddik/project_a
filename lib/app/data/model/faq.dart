class FAQModel {
  String? faqCategoryEnglish;
  String? faqCategoryBangla;
  List<Faqs>? faqs;

  FAQModel({this.faqCategoryEnglish, this.faqCategoryBangla, this.faqs});

  FAQModel.fromJson(Map<String, dynamic> json) {
    faqCategoryEnglish = json['faq_category_english'];
    faqCategoryBangla = json['faq_category_bangla'];
    if (json['faqs'] != null) {
      faqs = <Faqs>[];
      json['faqs'].forEach((v) {
        faqs!.add(new Faqs.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['faq_category_english'] = this.faqCategoryEnglish;
    data['faq_category_bangla'] = this.faqCategoryBangla;
    if (this.faqs != null) {
      data['faqs'] = this.faqs!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Faqs {
  String? sId;
  String? faqQuestionEnglish;
  String? faqQuestionBangla;
  String? faqAnswerEnglish;
  String? faqAnswerBangla;
  String? faqCategoryEnglish;
  String? faqCategoryBangla;
  int? iV;

  Faqs(
      {this.sId,
      this.faqQuestionEnglish,
      this.faqQuestionBangla,
      this.faqAnswerEnglish,
      this.faqAnswerBangla,
      this.faqCategoryEnglish,
      this.faqCategoryBangla,
      this.iV});

  Faqs.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    faqQuestionEnglish = json['faq_question_english'];
    faqQuestionBangla = json['faq_question_bangla'];
    faqAnswerEnglish = json['faq_answer_english'];
    faqAnswerBangla = json['faq_answer_bangla'];
    faqCategoryEnglish = json['faq_category_english'];
    faqCategoryBangla = json['faq_category_bangla'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['faq_question_english'] = this.faqQuestionEnglish;
    data['faq_question_bangla'] = this.faqQuestionBangla;
    data['faq_answer_english'] = this.faqAnswerEnglish;
    data['faq_answer_bangla'] = this.faqAnswerBangla;
    data['faq_category_english'] = this.faqCategoryEnglish;
    data['faq_category_bangla'] = this.faqCategoryBangla;
    data['__v'] = this.iV;
    return data;
  }
}
