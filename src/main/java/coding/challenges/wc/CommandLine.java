package coding.challenges.wc;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

public class CommandLine {

    public final List<Option> options;
    public final File file;

    private CommandLine(Builder builder) {
        this.options = builder.options;
        this.file = builder.file;
    }

    public static Builder commandLine() {
        return new Builder();
    }

    public static class Builder {

        private final List<Option> options = new ArrayList<>();
        private File file;

        private Builder() {
        }

        public Builder withOption(Option option) {
            options.add(option);
            return this;
        }

        public Builder withFile(File file) {
            this.file = file;
            return this;
        }

        public CommandLine build() {
            return new CommandLine(this);
        }
    }
}
