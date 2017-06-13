1 => int done;

JCRev r;
Echo e;

[ 110.0, 146.83, 220.0, 130.81, 164.81 ] @=> float notes[];
5 => int numnotes;

fun float getnote(float octave) {
   return octave * notes[Std.rand2(0,numnotes-1)] + Std.randf();
}

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

for(0 => int i; i < 8; i++) {
   spork ~ percussion();
   (4096*2)::ms => now;
}

(4096*16)::ms => now;

0 => done;
