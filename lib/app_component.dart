// Copyright (c) 2016, <your name>. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

library dost.app_component;

import 'package:angular2/angular2.dart';
import 'package:dost/components/newtask_component/newtask_component.dart';
import 'package:dost/components/tasklist_component/tasklist_component.dart';

@Component(
    selector: 'my-app',
    templateUrl: 'app_component.html',
    directives: const [TaskListComponent])
class AppComponent {}
