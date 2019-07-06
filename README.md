# Conference Flutter App

`Now with more Redux!`

On Sunday 28 of October we[1] decided to build a little multiplatform conference app for DACHFest[2] 2018.

We decided to write it from scratch because we wanted:

1. Something simple and to the point (showing the schedule).
2. Something multiplatform (and that's why we used Flutter).
3. A fun weekend project for the two of us.

[1] authors are: Lara Martín and Miguel Beltran.

[2] https://www.dachfest.com

The app has two conferences currently:

- DACHFest in the `dachfest` branch.
- CFCamp[3] in the `cfcamp` branch.

[3] https://www.cfcamp.org/

## Running

1. Create a file named `key.properties` in the `dachfest/android` folder.
2. Add the following text inside:

```
storePassword=
keyPassword=
keyAlias=
storeFile=""
```
(You can replace this data with your own to do a signed release APK)

3. Now you can run the project.

## FAQ

**Could you add...?**

No, we are not open for suggestions. Feel free to submit a PR, but we may or may not merge it.
We don't have time to maintain it.

**Is the app code correct?**

We have refactored the app code to use Redux v3. 
Which makes it a cool example to understand how Redux works.

However, there are some good practices that we ignored, for example
writing UI tests or implementing dependency injection.

i.e. don't take this project as a GOOD Flutter app example.

But it does what it is supposed to do :-)

**Can I fork the project and build my own conference app?**

Yes! The app is open source, so please follow the attached licenses.

Otherwise, if you can pay it, we can do it for you: http://beltran.work/

## Licencing

```
   All resources and conference information found in the app belong to the DACHFest
   organizing team and were taken from https://github.com/DACHFest/dachfest.com

   Copyright 2018, 2019 Lara Martín and Miguel Beltran.

   Licensed under the Apache License, Version 2.0 (the "License");
   you may not use this file except in compliance with the License.
   You may obtain a copy of the License at

       http://www.apache.org/licenses/LICENSE-2.0

   Unless required by applicable law or agreed to in writing, software
   distributed under the License is distributed on an "AS IS" BASIS,
   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
   See the License for the specific language governing permissions and
   limitations under the License.
```
