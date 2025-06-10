file(GLOB_RECURSE GAME_launcher CONFIGURE_DEPENDS "src/*.cpp")
add_executable(Game_Launcher ${GAME_launcher})
target_link_libraries(Game_Launcher PRIVATE Game)