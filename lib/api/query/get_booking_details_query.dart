String readRepositories = """
  query getBookings(\$currentPage: Int!, \$requestType: String!) {
  getBookings(currentPage: \$currentPage, requestType: \$requestType) {
    results {
      bookings {
        id
        riderLocation
        riderLocationLat
        riderLocationLng
        isSpecialTrip
        specialTripPrice
        specialTripTotalFare
        isTipGiven
        tipsAmount
        tipsTotalFare
        tipsDriverTotalFare
        pickUpLocation
        pickUpLat
        pickUpLng
        dropOffLocation
        dropOffLat
        dropOffLng
        riderId
        driverId
        tripStatus
        vehicleType
        totalRideDistance
        baseFare
        baseUnit
        riderServiceFee
        riderTotalFare
        driverTotalFare
        driverServiceFee
        estimatedTotalFare
        totalFare
        totalDuration
        paymentType
        paymentStatus
        transactionId
        startDate
        currency
        startTime
        endDate
        endTime
        tripStart
        tripEnd
        riderDetails {
          userId
          userData {
            lat
            lng
            overallRating
            phoneNumber
          }
          firstName
          lastName
          picture
          location
        }
        driverDetails {
          userId
          userData {
            lat
            lng
            overallRating
            phoneNumber
          }
          firstName
          lastName
          picture
          location
          vehicleDetails {
            id
            vehicleName
            vehicleCategoryDetails {
              id
              categoryName
              categoryImage
              categoryMarkerImage
              unitPrice
              basePrice
              isActive
              currency
              createdAt
              updatedAt
            }
          }
        }
      }
      count
    }
    status
    errorMessage
  }
}
""";