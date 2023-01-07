class _TrackingInformationBefore {
  _TrackingInformationBefore(this.shippingCompany, this.trackingNumber);

  String shippingCompany;
  String trackingNumber;

  String display() {
    return "$shippingCompany: $trackingNumber";
  }
}

class _ShipmentBefore {
  _ShipmentBefore(this.trackingInformation);

  _TrackingInformationBefore trackingInformation;

  String trackingInfo() {
    return trackingInformation.display();
  }

  _TrackingInformationBefore getTrackingInformation() {
    return trackingInformation;
  }

  void setTrackingInformation(_TrackingInformationBefore trackingInformation) {
    this.trackingInformation = trackingInformation;
  }
}

class _ShipmentAfter {
  _ShipmentAfter(this.shippingCompany, this.trackingNumber);

  String shippingCompany;
  String trackingNumber;

  String display() {
    return "$shippingCompany: $trackingNumber";
  }
}
