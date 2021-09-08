abstract class NewStates{}
class NewInitialState extends NewStates{}
class NewBottomNavState extends NewStates{}
class NewsGetBusinessSuccessState extends NewStates{}
class NewsGetBusinessErrorState extends NewStates{
  final String error;

  NewsGetBusinessErrorState(this.error);
}
class NewsLoadingBusinessState extends NewStates{}

class NewsGetSportSuccessState extends NewStates{}
class NewsGetSportErrorState extends NewStates{
  final String error;

  NewsGetSportErrorState(this.error);
}
class NewsLoadingSportState extends NewStates{}

class NewsGetScienceSuccessState extends NewStates{}
class NewsGetScienceErrorState extends NewStates{
  final String error;

  NewsGetScienceErrorState(this.error);
}
class NewsLoadingScienceState extends NewStates{}

class NewsGetSearchSuccessState extends NewStates{}
class NewsGetSearchErrorState extends NewStates{
  final String error;

  NewsGetSearchErrorState(this.error);
}
class NewsLoadingSearchState extends NewStates{}


class NewsChangeThemeModeState extends NewStates{}

