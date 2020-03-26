# ratpsy
INFO: This project is for analysis of behavioral responses of rats to a light discrimination task.

TASK: @AhmedRamadanUant describe the task...
      Brief description of the Signal Descrimination Task:

      In a 3 poke setup, a subject is required to initiate a trial by inserting his nose in the center poke (initiating) and remain there for 1000 ms
      (fixation period). Successfully holding its nose for the required time triggers the next state where lights are displayed from a right and left LEDs
      installed right above the right and left nose pokes. The right and left light intensities are varied pseudorandomely among 10 conditions.
      In 5 conditions, the relative difference of brightness is bigger on the left side, and the opposite is the case in the other five. 

      The rat is required to decide which side is brighter, and report his decision by withdrawing from the center poke and move sidewards to make a side
      poke where light was brighter. A correct decision by the water restricted rat is rewarded with a drop of water. An incorrect choice is punished with 
      a 5 seconds timeout. After either reward delivery or timeout the rat has to wait for a 3 second intertrial interval before being able to start a 
      new trial.

Definitions of premature responding:


1- Anticipatory responses:

   when the rat breaks the fixation/hold period , designated by the code number: 7 in the raw data files.


   The index is = number of aborted fixations to the number of successful fixations (display-stimulus)

                = number of 7s                to number of 4s



2- Premature responding:

   A- When the rats try to initiate a trial during ITI:


   The index is = number of center pokes during ITI

                = number of 15s          during 12s



   B- When the rat can not wait until the penality time elapses:


   The index is = number of center pokes during time-out

                = number of 15s          during 9s
