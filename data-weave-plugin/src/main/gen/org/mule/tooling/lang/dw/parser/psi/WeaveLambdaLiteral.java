// This is a generated file. Not intended for manual editing.
package org.mule.tooling.lang.dw.parser.psi;

import java.util.List;
import org.jetbrains.annotations.*;
import com.intellij.psi.PsiElement;

public interface WeaveLambdaLiteral extends WeaveExpression {

  @NotNull
  WeaveExpression getExpression();

  @NotNull
  List<WeaveFunctionParameter> getFunctionParameterList();

  @NotNull
  List<WeaveTypeParameter> getTypeParameterList();

}
