// This is a generated file. Not intended for manual editing.
package org.mule.lang.dw.parser.psi.impl;

import java.util.List;
import org.jetbrains.annotations.*;
import com.intellij.lang.ASTNode;
import com.intellij.psi.PsiElement;
import com.intellij.psi.PsiElementVisitor;
import com.intellij.psi.util.PsiTreeUtil;
import static org.mule.lang.dw.parser.psi.WeaveTypes.*;
import org.mule.lang.dw.parser.psi.WeaveNamedElementImpl;
import org.mule.lang.dw.parser.psi.*;
import com.intellij.psi.PsiReference;

public class WeaveFunctionCallExpressionImpl extends WeaveNamedElementImpl implements WeaveFunctionCallExpression {

  public WeaveFunctionCallExpressionImpl(ASTNode node) {
    super(node);
  }

  public void accept(@NotNull PsiElementVisitor visitor) {
    if (visitor instanceof WeaveVisitor) ((WeaveVisitor)visitor).visitFunctionCallExpression(this);
    else super.accept(visitor);
  }

  @Override
  @NotNull
  public List<WeaveExpression> getExpressionList() {
    return PsiTreeUtil.getChildrenOfTypeAsList(this, WeaveExpression.class);
  }

  @Override
  @NotNull
  public WeaveIdentifier getIdentifier() {
    return findNotNullChildByClass(WeaveIdentifier.class);
  }

  public PsiReference getReference() {
    return WeavePsiImplUtils.getReference(this);
  }

}