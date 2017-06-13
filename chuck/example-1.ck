1 => int done;

fun void percussion() {
   Shakers perc => JCRev r1 => Pan2 p1 => dac;
   perc => dac;
   0.7 + Std.randf() => perc.gain;
   while(done > 0) {
      -1 + Std.randf()*2 => p1.pan;
      if(Std.rand()%8)  {
         Std.rand()%22 => perc.preset;
         30 + Std.rand()%100 => perc.freq;
      }
      Std.randf()+0.5 => perc.noteOn;
      128::ms => now;
   }
}

JCRev r;
Echo e;
96::ms => e.delay;

[ 110.0, 146.83, 220.0, 130.81, 164.81 ] @=> float notes[];
5 => int numnotes;

fun float getnote(float octave) {
   return octave * notes[Std.rand2(0,numnotes-1)] + Std.randf();
}

fun void voice1 (float octave, float pan) {
   24 => int count;
   BandedWG bb => Pan2 p => r => dac;
   5 => bb.gain;
   while(--count) {
      pan + Std.randf()*0.1 => p.pan;
      getnote(2.0) => bb.freq;
      0.6 + Std.randf()*0.4  => bb.noteOn;
      (Std.rand()%3*1024 + 1024)::ms => now;
      1.0 => bb.noteOff;
   }
}

function void voice2 (float octave, float pan) {
   24 => int count;
   TubeBell tb => Pan2 p => dac;
   while(--count) {
      Std.randf()*0.3 => p.pan;
      getnote(2.0) => tb.freq;
      0.6 + Std.randf()*0.2  => tb.noteOn;
      (Std.rand()%4*1024 + 1024)::ms => now;
      1.0 => tb.noteOff;
   }
}

//1 => int done;
spork ~ percussion();
4::ms => now;
spork ~ percussion();

(4096*4)::ms => now;
for(0 => int i; i < 8; i++) {
   spork ~ voice1(1+Std.rand()%2, -1+Std.rand()*2);
   (4096*2)::ms => now;
   spork ~ voice2(1+Std.rand()%2, -1+Std.rand()*2);
   (4096*3+512)::ms => now;
}

(4096*16)::ms => now;

0 => done;
