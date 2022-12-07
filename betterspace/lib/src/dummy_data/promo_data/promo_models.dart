class PromoModel {
  late String promoId;
  late String promoCode;
  late double promoDiscountValue;
  late DateTime promoValidAt;
  late DateTime promoValidUntil;
  late String promoImageBanner;
  PromoModel(
      {required this.promoId,
      required this.promoCode,
      required this.promoDiscountValue,
      required this.promoValidAt,
      required this.promoValidUntil,
      required this.promoImageBanner});
}
