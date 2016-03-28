// Copyright (c) 2016, <your name>. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

library dost.app_component;

import 'package:angular2/core.dart';
import 'package:angular2/router.dart';
import 'package:dost/components/tasklist_component/tasklist_component.dart';
import 'package:dost/components/about-component/about_component.dart';

@Component(
    selector: 'my-app',
    templateUrl: 'app_component.html',
    directives: const [TaskListComponent, ROUTER_DIRECTIVES],
    providers: const [ROUTER_PROVIDERS])
@RouteConfig(const [
  const Route(
      path: '/',
      name: 'Tasklist',
      component: TaskListComponent,
      useAsDefault: true),
  const Route(path: '/about', name: 'About', component: AboutComponent)
])
class AppComponent {}
