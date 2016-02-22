package org.mule.lanucher.configuration;

import com.intellij.execution.configurations.ConfigurationFactory;
import com.intellij.execution.configurations.RunConfiguration;
import com.intellij.openapi.project.Project;
import org.mule.util.MuleIcons;

import javax.swing.*;


class MuleConfigurationFactory extends ConfigurationFactory {

    public MuleConfigurationFactory(MuleConfigurationType configurationType) {
        super(configurationType);
    }

    public RunConfiguration createTemplateConfiguration(Project project) {
        return new MuleConfiguration("Mule ESB", this, project);
    }
}
