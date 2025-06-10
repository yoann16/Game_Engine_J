file(GLOB_RECURSE ENGINE_src CONFIGURE_DEPENDS "src/*.cpp" )
file(GLOB_RECURSE ENGINE_include CONFIGURE_DEPENDS "include/*.h")
add_library(Game_Engine STATIC ${ENGINE_src} ${ENGINE_include})
target_include_directories(Game_Engine PUBLIC "include")
