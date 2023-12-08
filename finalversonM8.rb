
tempo = 100

#invert the chord function
define :invert do |some_chord|
  return some_chord[1..3] + [some_chord[0] + 12]
end

#4 beats slowly played after eachother
define :calm_section do
  play_pattern_timed [:c4, :e4, :g4, :c5], [0.9, 0.9, 0.9, 1]
  play_pattern_timed [:c4, :e4, :g4, :b4], [0.9, 0.9, 0.9, 1]
  
end

#repeat pattern multiple times
define :repeat_pattern do
  20.times do
    
    play chord(:c, :major).choose, attack: 0, release: 0.7, cutoff: 30
    sleep 0.5
  end
end



#calm_section just at a lower tempo
define :slow_calm_section do
  tempo = 60
  use_bpm tempo
  play_pattern_timed [:c4, :e4, :g4, :c5], [0.9, 0.9, 0.9, 1]
  play_pattern_timed [:c4, :e4, :g4, :b4], [0.9, 0.9, 0.9, 1]
  
end

#beats strung together to create a tune
define :tune_one do
  
  use_bpm tempo
  cmj = chord(:c, :major)
  cmj_invert = invert(cmj)
  cmj = chord(:c, :major)
  
  play cmj, amp: 0.7
  sleep(1)
  play invert_chord(cmj, 1)
  sleep(1)
  play invert_chord(cmj, 2)
  play cmj
  sleep(1)
  play cmj_invert
  sleep(1)
  play chord(:g, :m9)
  sleep(1)
  play invert_chord(cmj, 1)
  sleep(1)
  play cmj
  sleep(1)
  play invert_chord(cmj, 1)
  sleep(1)
  
end

#repeated beat string for the bridge part of the song
define :outlast do
  
  sleep(1)
  play chord(:c, :major).choose, attack: 0, release: 4, cutoff: 30
  sleep(2)
  play chord(:c, :major)
  sleep(0.5)
  play chord(:c, :major)
  sleep(0.5)
  
  play chord(:c, :major).choose, attack: 0, release: 4, cutoff: 30
  sleep(2)
  
end

#first part of the longer notes held out
define :bridge_one do
  
  cmj = chord(:c, :major)
  cmj_invert = invert(cmj)
  
  
  play outlast
  
  3.times do
    
    play cmj, attack: 3, release: 2
    sleep(1)
    play cmj_invert, attack: 3, release: 2
    sleep(1)
    
  end
  
  3.times do
    play chord(:c, :m7), attack: 3, release: 2
    sleep(1)
    play chord(:d, :m7), attack: 3, release: 2
    sleep(1)
    
  end
  
  use_bpm 50
  
end

#sencond part of the longer notes held out
define :bridge2 do
  cmj = chord(:c, :major)
  cmj_invert = invert(cmj)
  
  
  play chord(:c, :major), attack: 3, release: 2
  sleep(1)
  play cmj_invert, attack: 3, release: 2
  sleep(1)
  
  use_bpm 100
  2.times do
    play chord(:c, :m9), attack: 3, release: 2
    sleep(1)
    play chord(:d, :m9), attack: 3, release: 2
    sleep(1)
    
    play outlast
    
    play chord(:c, :major).choose, attack: 0, release: 4, cutoff: 30
    sleep(2)
    play chord(:c, :major), attack: 3, release: 2
    sleep(1)
    play cmj_invert , attack: 3, release: 2
    sleep(1)
    
  end
end




#START OF THE SONG
#-----------------------------------------------------------------------------------------------------------------
2.times do
  
  
  #repeats tune_one twice
  2.times do
    
    use_bpm tempo
    play tune_one
    
  end
  
  
  sleep(0.5)
  
  #plays the calm section twice
  
  play calm_section
  play calm_section
  
  
  play chord(:c, :major), attack: 1, release: 7
  
  #repects faster beats
  
  play repeat_pattern
  
  #plays calm section twice -- make these slower calm section and segway into a slower bridge
  
  use_bpm 100
  play calm_section
  play calm_section
  play slow_calm_section
  
end

play outlast

3.times do
  
  play bridge_one
  
  
end

sleep(3)
play outlast

play bridge2

use_bpm 30

play repeat_pattern
play slow_calm_section

use_bpm 60

play repeat_pattern
play calm_section

sleep 0.5

use_bpm 80

play repeat_pattern
sleep 0.5

use_bpm 100

play calm_section
play calm_section
play tune_one
play tune_one
play calm_section

use_bpm 20

play calm_section




