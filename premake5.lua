project "GLFW"
kind "StaticLib"
language "C"

files
{
    "src/init.c",
    "src/context.c",
    "src/input.c",
    "src/monitor.c",
    "src/window.c",
    "src/vulkan.c",
    "src/platform.c",
    "src/internal.h",
    "src/mappings.h"
}

filter "system:windows"
    systemversion "latest"
    staticruntime "off"
    -- Place vendor outputs under the workspace Binaries tree (consistent with other projects)
    targetdir ("%{wks.location}/Binaries/windows-x86_64-%{cfg.buildcfg}/%{prj.name}")
    objdir ("%{wks.location}/Binaries/Intermediates/windows-x86_64-%{cfg.buildcfg}/%{prj.name}")

    buildoptions { "/WX-" }

    files
    {
        "src/win32_init.c",
        "src/win32_module.c",
        "src/win32_joystick.c",
        "src/win32_monitor.c",
        "src/win32_time.h",
        "src/win32_time.c",
        "src/win32_thread.h",
        "src/win32_thread.c",
        "src/win32_window.c",
        "src/wgl_context.c",
        "src/egl_context.c",
        "src/osmesa_context.c",
        "src/null_init.c",
        "src/null_joystick.c",
        "src/null_monitor.c",
        "src/null_window.c",
        "src/null_platform.h"
    }

    defines 
    { 
        "_GLFW_WIN32",
        "_CRT_SECURE_NO_WARNINGS"

    }

filter "system:linux"
    pic "On"
    systemversion "latest"
    staticruntime "off"
    targetdir ("%{wks.location}Binaries/%{cfg.system}-%{cfg.architecture}-%{cfg.buildcfg}/%{prj.name}")
    objdir ("%{wks.location}Binaries/Intermediates/%{cfg.system}-%{cfg.architecture}-%{cfg.buildcfg}/%{prj.name}")

    files
    {
        "src/x11_init.c",
        "src/x11_monitor.c",
        "src/x11_window.c",
        "src/xkb_unicode.c",
        "src/posix_time.c",
        "src/posix_thread.c",
        "src/glx_context.c",
        "src/egl_context.c",
        "src/osmesa_context.c",
        "src/linux_joystick.c"
    }

    defines
    {
        "_GLFW_X11"
        
    }

filter "configurations:Debug"
    runtime "Debug"
    symbols "On"

filter "configurations:Release"
    runtime "Release"
    optimize "On"
