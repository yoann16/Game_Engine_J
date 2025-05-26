cmake_minimum_required(VERSION 3.10)
project(GameEngineJ VERSION 1.0)

#Config for C++20 
set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED ON)


#Config for the libraries 



#Include module subdirectories
add_subdirectory(Game_Engine)
add_subdirectory(Game)
add_subdirectory(Game_Launcher)