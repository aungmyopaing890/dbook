class RequestPathHolder {
  RequestPathHolder(
      {this.itemId,
      this.regionId,
      this.currentPage,
      this.orderId,
      this.headerToken});

  final String? currentPage;
  final String? itemId;
  final String? regionId;
  final String? orderId;
  final String? headerToken;
}
