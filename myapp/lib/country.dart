class Country {
  final String name;
  final String capital;
  final String continents;
  final String currencies;
  final int population;
  final String timezones;
  final String flag;

  const Country({
    required this.name,
    required this.capital,
    required this.continents,
    required this.currencies,
    required this.population,
    required this.timezones,
    required this.flag,
  });

  factory Country.fromJSON(Map<String, dynamic> json) {
    return Country(
        name: json['name']['official'],
        capital: json['capital'][0],
        continents: json['continents'][0],
        currencies: (json['currencies'] as Map<String, dynamic>).keys.first,
        population: json['population'],
        timezones: json['timezones'][0],
        flag: json['flags']['png']);
  }
}
