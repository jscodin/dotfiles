# Reduce Method

Using return at the beginning immediately returns the value once the function has ran. Reduce takes array and finally returns one value once callbackFn has finished.

The way reduce works here is, the accumulator (1st param - "oldest") starts with Ray, because no initial value is set, otherwise it would have been Carly. (If unsure check out the find the oldest task from the JavaScript30).

It then runs through the rest of the function. Runs the getAge function and gets Rays year of birth and year of death and stores this in oldestAge variable.
Then moves on to the second parameter and chooses Jane, and once again runs the getAge function etc. (I am using last test as the example).

Finally it then compares Ray to Jane (oldestAge:49 < currentAge:29), "oldest" gets returned as Ray is older (49) and results in a falsy. Which means Ray object stays in the accumulator arg in the reduce function.

Carly would then be next, the above would all run, then finally at the end, as Carly(currentPerson) is older this would return a truthy, so currentPerson would now get put into the accumulator, which is Carly. However as there are no more objects/items in the array in this example, it just returns the Carly object and finishes. 

```
return array.reduce((oldest, currentPerson) => {
    const oldestAge = getAge(oldest.yearOfBirth, oldest.yearOfDeath);
    const currentAge = getAge(
      currentPerson.yearOfBirth,
      currentPerson.yearOfDeath
    );
    return oldestAge < currentAge ? currentPerson : oldest;
  });
};

const getAge = function (birth, death) {
  if (!death) {
    death = new Date().getFullYear();
  }
  return death - birth;
};```
