String getWeatherCondition({
  required double temperature,
  required double humidity,
  required double cloudCover,
  required double precipitationProbability,
}) {
  if (precipitationProbability > 70) {
    return "Rainy";
  }

  if (cloudCover > 80) {
    return "Cloudy";
  }

  if (temperature > 30 && humidity < 50) {
    return "Hot & Dry";
  }

  if (temperature < 15) {
    return "Cold";
  }

  if (humidity > 80) {
    return "Humid";
  }

  return "Clear";
}
