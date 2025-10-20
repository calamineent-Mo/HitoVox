
cmake_minimum_required(VERSION 3.15)
project(HitoVox VERSION 1.0.0)

if(NOT DEFINED JUCE_DIR)
  message(FATAL_ERROR "Please set JUCE_DIR to your JUCE root or add JUCE as a submodule (see README).")
endif()

list(APPEND CMAKE_MODULE_PATH "{{JUCE_DIR}}/extras/Build/CMake")
include(JUCE)

juce_add_plugin(HitoVox
  COMPANY_NAME "Calamine Entertainment"
  IS_SYNTH FALSE
  NEEDS_MIDI_INPUT FALSE
  NEEDS_MIDI_OUTPUT FALSE
  IS_MIDI_EFFECT FALSE
  COPY_PLUGIN_AFTER_BUILD TRUE
)

target_sources(HitoVox
  PRIVATE
    PluginProcessor.cpp
    PluginProcessor.h
    PluginEditor.cpp
    PluginEditor.h
    dsp/IIRFilter.h
    dsp/ParametricEQ.h
    dsp/Compressor1176.h
    dsp/Nonlinear1176.h
    dsp/LookaheadCompressor.h
    BinaryData.cpp
    BinaryData.h
    UI/LookAndFeel.h
    UI/LookAndFeel.cpp
    PresetManager.h
    resources/HitoVox_mic.svg
)

target_compile_features(HitoVox PRIVATE cxx_std_17)

target_link_libraries(HitoVox
  PRIVATE
    juce::juce_audio_utils
    juce::juce_dsp
)

juce_generate_juce_header(HitoVox)
