# ratpsy
INFO: This project is for analysis of behavioral responses of rats to a light discrimination task.

TASK: @AhmedRamadanUant describe the task...
      Description of the Signal Descrimination Task:

      In a 3 poke setup, a subject is required to initiate a trial by inserting his nose in the center poke (initiating) and remain there for 1000 ms
      (fixation period). Successfully holding its nose for the required time triggers the next state where lights are displayed from a right and left LEDs
      installed right above the right and left nose pokes. The right and left light intensities are varied pseudorandomely among 10 conditions.
      In 5 conditions, the relative difference of brightness is bigger on the left side, and the opposite is the case in the other five. 

      The rat is required to decide which side is brighter, and report his decision by withdrawing from the center poke and move sidewards to make a side
      poke where light was brighter. A correct decision by the water restricted rat is rewarded with a drop of water. An incorrect choice is punished with 
      a 5 seconds timeout. After either reward delivery or timeout the rat has to wait for a 3 second intertrial interval before being able to initiate a 
      new trial.

      The task allows evalutation of multiple behavioral parameters such as accuracy, reaction time, movement time, and premature responding. Analysis 
      of these parameters under different conditions can give insight into the different aspects of complex conditioned behavior.


Definitions and indices of different kinds of premature responding:

1- Anticipatory responses:

   when the rat breaks the fixation/hold period (which is designated by the code number: 7 ; aborted fixation in the raw data files).

   The index is = the proportion of the number of aborted fixations to the number of successful fixations (display-stimulus, code No:4)

                = number of 7s to number of 4s


2- Premature responding:

   A- When the rats try to initiate a trial during ITI (code No:12):

   The index is = number of center pokes happening during the interval between start of ITI and start of 'wait_for_init': 1, or 'current_trial': 2

                = number of 15s happening in the interval between 1 minus 12 + number of 15s happening in the interval between 2  minus 12



   B- When the rat can not wait until the penality time elapses:


   The index is = number of center pokes in the interval between start of 'time_out': 9 and 'wait_for_init': 1

                = number of 15s happening in the interval between 1 minus 9 
