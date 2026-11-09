# %% [markdown]
# # CCE3206 - Digital Signal Processing
# ## Practical 2: Discrete Time Signals
# **Name:** Dave Galea
# **Student ID:** 0283404L

# %% [markdown]
# ## Task 1

# %%
import numpy as np
def iir_filter(x):
    # set y to have the same length and type as x
    y = np.zeros_like(x, dtype=float)
    # iterate over all input samples
    w_n_minus_1 = 0

    # compute y(n) and store it in y[n]
    for n, x_n in enumerate(x):
        w_n = (0.6 * w_n_minus_1) + x_n
        y_n = (0.2 * w_n_minus_1) + (0.2 * w_n)
        y[n] = y_n
        w_n_minus_1 = w_n

    return y # return the array 

# %% [markdown]
# ## Task 2

# %% [markdown]
# ### a)

# %%
x_n = np.zeros(10)
x_n[0] = 1 

# %% [markdown]
# ### b)

# %%
y_n = iir_filter(x_n)

# %% [markdown]
# ### c)

# %%
import matplotlib.pyplot as plt
fig, ax = plt.subplots()
n = np.arange(len(y_n))
ax.stem(n, y_n)
ax.set_xlabel('$n$')
ax.set_ylabel('$y(n)$')
plt.grid()
plt.show()

# %% [markdown]
# ## Task 3 

# %% [markdown]
# ### a)

# %%
x_n = np.ones(20)

# %% [markdown]
# ### b)

# %%
y_n = iir_filter(x_n)

# %% [markdown]
# ### c)

# %%
import matplotlib.pyplot as plt
fig, ax = plt.subplots()
n = np.arange(len(y_n))
ax.stem(n, y_n)
ax.set_xlabel('$n$')
ax.set_ylabel('$y(n)$')
plt.grid()
plt.show()

# %% [markdown]
# ## Task 4 

# %% [markdown]
# ### a)

# %%
x_n = np.zeros(20)
x_n[0:10] = np.ones(10)

# %% [markdown]
# ### b)

# %%
y_n = iir_filter(x_n)

# %% [markdown]
# ### c)

# %%
import matplotlib.pyplot as plt
fig, ax = plt.subplots()
n = np.arange(len(y_n))
ax.stem(n, y_n)
ax.set_xlabel('$n$')
ax.set_ylabel('$y(n)$')
plt.grid()
plt.show()

# %% [markdown]
# ## Task 5 

# %% [markdown]
# ### a)

# %%
from scipy.io import wavfile
[fs, x] = wavfile.read('tones.wav')

# %% [markdown]
# ### b)

# %%
y = iir_filter(x)
filtered_audio = y

# %% [markdown]
# ### c)

# %%
wavfile.write('output_tones.wav', fs, filtered_audio.astype(x.dtype))

# %% [markdown]
# ### d)
# 
# Using Audacity, the input audio (tones) and output audio (output_tones) were compared. This software was particularly useful, as the effect was not very apparent from just listening. However, when viewed this way, it can clearly be seen that the output audio has a decreasing amplitude as the tone frequency increases over time, in contrast to the input audio's constant amplitude. This shows that the system acts as a low pass filter; attenuating higher frequencies and letting lower ones pass. 

# %% [markdown]
# ![image.png](attachment:image.png)

# %% [markdown]
# ## task 6 

# %%
from scipy.fft import fft, fftfreq

X = fft(x) / len(x)
# spectrum is symmetric, so remove second half
X = X[:len(X) // 2]
Xp = np.abs(X) ** 2

# frequencies corresponding to the output of fft
F = fftfreq(len(x), 1 / fs)
F = F[:len(F) // 2]

fig, ax = plt.subplots()
ax.plot(F, Xp)
ax.set_xlabel('$F$')
ax.set_ylabel('$|X(F)|^2$')
ax.grid(True)

# Power spectrum of Y against F 
Y = fft(y) / len(y)
Y = Y[:len(Y) // 2]
Yp = np.abs(Y) ** 2

F = fftfreq(len(y), 1 / fs)
F = F[:len(F) // 2]

fig, ax = plt.subplots()
ax.plot(F,Yp)
ax.set_xlabel('$F$')
ax.set_ylabel('$|Y(F)|^2$')
ax.grid(True)

plt.show()

# %% [markdown]
# The output power spectrum shows greater attenuation at higher frequencies, while allowng lower frequencies to pass through; this indicates that the system is a low-pass filter. 
# 
# This corresponds with task 5d, where lower frequencies have the highest amplitude, and the amplitude steadily decreases as the tone frequency increases. 
# 
# 

# %% [markdown]
# ## Task 7

# %%
L = 150
w0 = 0.1

n = np.arange(L)
x = np.cos(n * w0)
y = iir_filter(x)

fig, ax = plt.subplots()
ax.plot(n, x, label='$x(n)$')
ax.plot(n, y, label='$y(n)$')
ax.set_xlabel('$n$')
ax.legend(loc='best', framealpha=1)
ax.grid(True)
plt.title("Sinusoid Response($\\omega_0$ = 0.1 rad/sample)")
plt.show()

# %% [markdown]
# ### Gain
# The Amplitudes of the output and input can be seen via zooming in on the above plot as shown below.
# 
# $$Gain =\frac{\text{output amplitude}}{\text{input amplitude}}$$
# 
# $$Gain =\frac{0.98}{1} = 0.98$$

# %%
fig, ax = plt.subplots()
ax.plot(n, x, label='$x(n)$')
ax.plot(n, y, label='$y(n)$')
ax.set_xlabel('$n$')
ax.legend(loc='best', framealpha=1)
ax.grid(True)
ax.set_xlim(60,70)
ax.set_ylim(0.95,1)
plt.title("Output vs input Amplitudes (zoomed in)")
plt.show()

# %% [markdown]
# ### Phase Shift
# $$Phase shift = -w_0 \times delay = -0.1 \times delay$$
# $$delay=n_{\text{output crossing}}-n_{\text{input crossing}}$$
# 
# From the graph below, for the chosen segment, we can see that: 
# 
# $$n_{\text{output crossing}} \approx 80.5 $$
# $$n_{\text{input crossing}} \approx 78.5 $$
# 
# Therefore: 
# 
# $$delay \approx 80.5 - 78.5 \approx 2$$
# $$Phase shift \approx -w_0 \times 2 = -0.1 \times 2 \approx -0.2$$

# %%
fig, ax = plt.subplots()
ax.plot(n, x, label='$x(n)$')
ax.plot(n, y, label='$y(n)$')
ax.set_xlabel('$n$')
ax.legend(loc='best', framealpha=1)
ax.grid(True)
ax.set_xlim(78,81)
ax.set_ylim(-0.0001,0.0001)

plt.title("Output vs input zero crossings (zoomed in)")
plt.show()

# %% [markdown]
# ## Task 8

# %%
freqs = np.geomspace(0.1, np.pi, 10)

L = 250
n = np.arange(L)

gains = []
phase_shifts = []

fig, axes = plt.subplots(5, 2, figsize=(15, 15))

for i in range(len(freqs)):
    ax = axes.flat[i]
    w0 = freqs[i]
    x = np.cos(n * w0)
    y = iir_filter(x)

    ax.plot(n, x, label='$x(n)$')
    ax.plot(n, y, label='$y(n)$')
    ax.set_xlabel('$n$')
    ax.set_xlim(40, 40 + 3 * 2 * np.pi / w0)  # show 3 cycles per subplot
    ax.legend(loc='best', framealpha=1)
    ax.grid(True)
    ax.set_title(rf'Sinusoid Response ($\omega_0$ = {w0:.3f} rad/sample)')

    # Measure Amplitudes
    Ax = np.max(np.abs(x[40:]))
    Ay = np.max(np.abs(y[40:]))

    # Find input crossing
    for k in range(40, L-1):
        if x[k] >= 0 and x[k+1] < 0: # a zero must lie between a + and a -
            nx = k + x[k] / (x[k] - x[k+1]) # interpolation
            break
    # find output crossing
    for k in range(int(nx), L-1):
        if y[k] >= 0 and y[k+1] < 0:
            ny = k + y[k] / (y[k] - y[k+1])
            break

    gain = Ay / Ax
    delay = ny - nx
    phase_shift = -w0 * delay 

    if gain > 1e-8:
        print(
            f"Frequency: {w0:.4f} rad/sample\n"
            f"Input amplitude: {Ax:.4f}, Output amplitude: {Ay:.4f}\n"
            f"Input crossing: {nx:.4f}, Output crossing: {ny:.4f}\n"
            f"Gain = {Ay:.4f} / {Ax:.4f} = {gain:.4f}\n"
            f"Delay = {ny:.4f} - {nx:.4f} = {delay:.4f} samples\n"
            f"Phase = -{w0:.4f} x {delay:.4f} = {phase_shift:.4f} rad\n"
        )

    gains.append(gain)
    phase_shifts.append(phase_shift)


fig.tight_layout()
plt.show()

print("Gains:", gains)
print("Phase shifts:", phase_shifts)

# %%
gains = np.array(gains)
phase_shifts = np.array(phase_shifts)

# Exclude the effectively zero-gain point
valid_gains = gains > 1e-8

fig, axes = plt.subplots(2, 1, figsize=(8, 7), sharex=True)

axes[0].semilogx(freqs[valid_gains], 20 * np.log10(gains[valid_gains]), 'o-')
axes[0].set_title('Measured Filter Frequency Response')
axes[0].set_ylabel('Magnitude (dB)')
axes[0].grid(True, which = 'both')

axes[1].semilogx(freqs[valid_gains], phase_shifts[valid_gains], 'o-')
axes[1].set_ylabel('Phase (radians)')
axes[1].set_xlabel('Frequency (rad/sample)')
axes[1].grid(True, which = 'both')

plt.tight_layout()
plt.show()

# %% [markdown]
# The Magnitude response decreases as frequency increases, confirming low pass behaviour of the system. The same trend appears in the phase, which becomes more negative as frequency increases, meaning the output increasingly lags behind the input.


