// This is a generated file. Not intended for manual editing.
package org.mule.lang.dw.parser.psi;

import java.util.List;
import org.jetbrains.annotations.*;
import com.intellij.psi.PsiElement;

public interface WeaveKeyValuePair extends PsiElement {

  @Nullable
  WeaveConditionalKeyValuePair getConditionalKeyValuePair();

  @Nullable
  WeaveDynamicKeyValuePair getDynamicKeyValuePair();

  @Nullable
  WeaveSimpleKeyValuePair getSimpleKeyValuePair();

}
