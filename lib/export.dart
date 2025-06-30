//!packages
export 'package:flutter/material.dart';
export 'package:get_it/get_it.dart';
export 'package:cached_network_image/cached_network_image.dart';
export 'package:shared_preferences/shared_preferences.dart';
export 'package:flutter_dotenv/flutter_dotenv.dart';
export 'package:flutter/services.dart';
export 'dart:convert';
export 'package:flutter_bloc/flutter_bloc.dart';
export 'package:equatable/equatable.dart';

//!constants
export 'package:u_movieapp_bloc/constants/my_theme_data.dart';
export 'package:u_movieapp_bloc/constants/my_app_icons.dart';
export 'package:u_movieapp_bloc/constants/my_app_constants.dart';
export 'package:u_movieapp_bloc/constants/my_app_colors.dart';
export 'package:u_movieapp_bloc/constants/api_constants.dart';

//!models
export 'package:u_movieapp_bloc/models/movies_genre.dart';
export 'package:u_movieapp_bloc/models/movies_model.dart';

//!repository
export 'package:u_movieapp_bloc/repository/movies_repo.dart';

//!screens
export 'package:u_movieapp_bloc/screens/movies_screen.dart';
export 'package:u_movieapp_bloc/screens/splash_screen.dart';

export 'package:u_movieapp_bloc/screens/movie_details.dart';
export 'package:u_movieapp_bloc/screens/favorites_screen.dart';

//!services
export 'package:u_movieapp_bloc/service/init_getit.dart';
export 'package:u_movieapp_bloc/service/navigation_service.dart';
export 'package:u_movieapp_bloc/service/api_service.dart';

//!viewmodel
export 'package:u_movieapp_bloc/viewmodel/favorites/favorites_bloc.dart';
export 'package:u_movieapp_bloc/viewmodel/movies/movies_bloc.dart';
export 'package:u_movieapp_bloc/viewmodel/theme/theme_bloc.dart';

//!Utils
export 'package:u_movieapp_bloc/utils/genre_utils.dart';

//!widgets
export 'package:u_movieapp_bloc/widgets/movies/favorite_btn.dart';
export 'package:u_movieapp_bloc/widgets/my_error_widget.dart';
export 'package:u_movieapp_bloc/widgets/cached_image.dart';
export 'package:u_movieapp_bloc/widgets/movies/movies_widget.dart';
export 'package:u_movieapp_bloc/widgets/movies/genres_list_widget.dart';
