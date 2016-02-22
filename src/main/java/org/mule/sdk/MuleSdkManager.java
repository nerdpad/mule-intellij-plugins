/*
 * Copyright 2000-2013 JetBrains s.r.o.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package org.mule.sdk;

import com.intellij.openapi.components.ServiceManager;
import org.jetbrains.annotations.NotNull;

import java.util.List;


public abstract class MuleSdkManager {

  public static MuleSdkManager getInstance() {
    return ServiceManager.getService(MuleSdkManager.class);
  }

  @NotNull
  public abstract MuleSdk findSdk(@NotNull String sdkPath);

  @NotNull
  public abstract List<? extends MuleSdk> getValidSdks();

}
