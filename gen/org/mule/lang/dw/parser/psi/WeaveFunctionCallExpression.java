// This is a generated file. Not intended for manual editing.
package org.mule.lang.dw.parser.psi;

import java.util.List;
import org.jetbrains.annotations.*;
import com.intellij.psi.PsiElement;
import com.intellij.psi.PsiReference;

public interface WeaveFunctionCallExpression extends WeaveExpression, WeaveNamedElement {

  @NotNull
  List<WeaveExpression> getExpressionList();

  @NotNull
  WeaveIdentifier getIdentifier();

  PsiReference getReference();

  String getName();

  PsiElement setName(String newName);

  PsiElement getNameIdentifier();

}