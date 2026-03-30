project "bx"
	kind "StaticLib"
	language "C++"
	cppdialect "C++20"
	staticruntime "off"
	conformancemode "On"

    targetdir ("bin/" .. outputdir .. "/%{prj.name}")
	objdir ("bin-int/" .. outputdir .. "/%{prj.name}")


    files
	{
		"src/**.h",
		"src/**.cpp",
		"include/**.h"
	}

    removefiles
	{
		"src/amalgamated.cpp"
	}

	includedirs
	{
		"include",
		"src",
        "3rdparty",
        "include/compat/msvc/"
	}

    filter "system:windows"
		systemversion "latest"
        buildoptions { "/Zc:__cplusplus", "/Zc:preprocessor" }
        exceptionhandling "Off"

	filter "configurations:Debug"
		runtime "Debug"
		symbols "on"

        defines
        {
            "BX_CONFIG_DEBUG"
        }

	filter "configurations:Release"
		runtime "Release"
		optimize "on"

	filter "configurations:Dist"
		runtime "Release"
		optimize "on"
        symbols "off"
