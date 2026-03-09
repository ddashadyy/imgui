project "ImGui"
    kind "StaticLib"
    language "C++"

    targetdir ("bin/" .. outputdir .. "/%{prj.name}")
    objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

    files
    {
        "imconfig.h",
        "imgui.h",
        "imgui.cpp",
        "imgui_draw.cpp",
        "imgui_tables.cpp",
        "imgui_widgets.cpp",
        "imgui_demo.cpp",
        "backends/imgui_impl_glfw.h",
        "backends/imgui_impl_glfw.cpp",
        "backends/imgui_impl_vulkan.h",
        "backends/imgui_impl_vulkan.cpp"
    }

    includedirs
    {
        ".",
        "backends",
        "%{wks.location}/Flux/vendor/GLFW/include",  
        "%{IncludeDir.Vulkan}"
    }

    filter "system:windows"
        systemversion "latest"
        staticruntime "On"

    filter { "system:windows", "configurations:Release" }
        buildoptions "/MT"