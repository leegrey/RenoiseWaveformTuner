Waveform Tuner is a simple utility for automatically tuning single cycle waveforms to C4. It analyses the buffer length of the selected sample and adjusts its `Transpose` and `Finetune` parameters so that the waveform loops at exactly C4.

As a convenience the `Loop` mode is set to `forward`.

The tool provides an Instrument Box context menu and a Keyboard Shortcut which will tune the currently selected sample.

The maximum transposition range in Renoise is -120 semitones to +120 semitones. Very long buffers may require a pitch adjustment that exceeds this range. Attempting to tune an oversized buffer will cause a notification to be displayed, and no adjustments will be applied. In practice, single cycle wave forms will generally never come close to this size limit. 

License: MIT
