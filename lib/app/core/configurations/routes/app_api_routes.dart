class AppApiRoutes {
  final String _pokeApi;

  static const size = 10;
  static const _baseUrl = 'https://pokeapi.co/api/v2';

  const AppApiRoutes({required String pokeApi}) : _pokeApi = pokeApi;

  factory AppApiRoutes.api() {
    return const AppApiRoutes(pokeApi: _baseUrl);
  }

  String getAllPokemons({
    int? limit,
    int? offset,
    String? search,
  }) =>
      _buildQueryParameters(
        url: '$_pokeApi/pokemon',
        limit: limit,
        offset: offset,
      );

  String getPokemonDetails(String pokemon) =>
      _buildPathParameter('$_pokeApi/pokemon', value: pokemon);

  String getPokemonSpecies(String id) =>
      _buildPathParameter('$_pokeApi/pokemon-species', value: id);

  String _buildQueryParameters({
    required String url,
    int? limit,
    int? offset,
  }) {
    final buffer = StringBuffer(url);
    buffer.write('?limit=${limit ?? size}');
    buffer.write('&offset=${offset ?? 0}');
    return buffer.toString();
  }

  String _buildPathParameter(
    String url, {
    required String value,
  }) =>
      '$url/$value';
}
