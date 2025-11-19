require "WaveformTuner"

renoise.tool():add_menu_entry {
      name = "Instrument Box:Waveform Tuner - Tune to C4",
    invoke = function()
       WaveformTuner(renoise.song().selected_instrument)
    end
}

renoise.tool():add_keybinding {
  name = "Global:Waveform Tuner:Waveform Tuner - Tune to C4",
  invoke = function(repeated)
    if (not repeated) then -- we ignore soft repeated keys here
        WaveformTuner(renoise.song().selected_instrument)
    end
  end
}

