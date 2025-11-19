class "WaveformTuner"

local this

function WaveformTuner:__init(instrument)
  self.instrument = instrument
  this = self 
  self:tune()
end

function WaveformTuner:tune()
  for i = 1, #this.instrument.samples do
    local sample = this.instrument.samples[i]
    local sample_buffer = sample.sample_buffer

    if sample_buffer.has_sample_data then
      local buffer_length = sample_buffer.display_length
      local sample_rate = sample_buffer.sample_rate -- Correct property

      if buffer_length > 0 then
        print(("Tuning sample: %s"):format(sample.name))

        local target_note = 60  -- C4
        local A4 = 69
        local A4_freq = 440

        -- Calculate the waveform frequency
        local freq = sample_rate / buffer_length

        -- Derive MIDI note from frequency
        local note = A4 + 12 * (math.log(freq / A4_freq) / math.log(2))

        -- How far off are we from the target note, in semitones
        local delta_semitones = target_note - note

        -- Split into coarse semitones and fractional cents
        local semitones = math.floor(delta_semitones)
        local cents = (delta_semitones - semitones) * 100

        -- Convert cents to Renoise fine_tune range (-127 .. +127)
        local fine_tune = math.floor((cents / 100) * 128 + 0.5)

        -- Range check - if the buffer is too long it will try 
        -- to set transpose to an illegal value and throw an error
        if semitones < -120 or semitones > 120 then
          renoise.app():show_warning(
            string.format(
              "The sample buffer is too long to tune to C4\n" ..
              "Shorter buffers are recommended.\n" ..
              "Buffer Size: %d samples\n" ..
              "Required Transposition: %d\n" .. 
              "Valid range: -120 to +120",
              buffer_length,
              semitones
            )
          )
          return
        end

        -- Apply tuning values to the sample
        sample.transpose = semitones
        sample.fine_tune = fine_tune
        sample.loop_mode = renoise.Sample.LOOP_MODE_FORWARD

        print(("  freq: %.2f Hz, note: %.2f, transpose: %d, fine_tune: %d"):format(
          freq, note, semitones, fine_tune
        ))
      end
    else
      print(("Sample %s has no audio data. Skipping."):format(sample.name))
    end
  end
end
