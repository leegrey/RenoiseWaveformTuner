I recently made a convenient little Renoise Tool which I have been finding very useful, and I was wondering if it was worth sharing with the community.

Waveform Tuner is a simple Renoise tool for tuning single cycle waveforms to C4. This is achieved by taking the length of the sample buffer and adjusting the `Transpose` and `Finetune` parameters such that the wave form will loop at C4.

As a convenience the `Loop` mode is set to `forward`.

The tool provides an Instrument Box context menu and a Keyboard Shortcut which will tune the currently selected sample.

That's it - it's very simple but when you're working with single cycle wave forms of different buffer lengths, this allows you to keep them all in tune with each other with a single keyboard shortcut. 

I made this initially to start learning the Renoise lua api, and I kind of assumed something like this already exists, but I haven't been able to find any that do exactly this. I think this could be easily confused with the EasyTune tool but it doesn't do the same thing. EasyTune seems to try to detect the pitch of a sample and adjust it to C, whereas this one works strictly by using the total length of the buffer and calculating the correct pitch adjustment so that it will loop at C4. 

So, does this tool already exist? Would it be worth submitting to the official Renoise tool library?

If you'd like to try it out, I've uploaded it to Github in the meantime:

https://github.com/leegrey/RenoiseWaveformTuner

License: MIT

